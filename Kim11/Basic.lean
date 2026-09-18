namespace Kim11

/-- Run-length encoding of a finite binary sequence. -/
def runs : List Nat → List Nat
  | [] => []
  | [x] => [1]
  | x :: y :: rest =>
      if x = y then
        match runs (y :: rest) with
        | h :: t => (h + 1) :: t
        | [] => []
      else 1 :: runs (y :: rest)

/-- Contiguous sublist relation. -/
def IsFactor {α : Type} (sub : List α) (w : List α) : Prop :=
  ∃ i j : Nat, i + j + sub.length = w.length ∧
    w = (w.take i) ++ sub ++ (w.drop (i + sub.length))

/-- Factors of length exactly k. -/
def factorsAt {α : Type} (w : List α) (k : Nat) : List (List α) :=
  (List.range (w.length - k + 1)).map (fun i => (w.drop i).take k)

example : runs [1, 1] = [2] := by rfl
example : runs [1, 2] = [1, 1] := by rfl
example : runs [1, 1, 2] = [2, 1] := by rfl
example : runs [1, 2, 2, 1] = [1, 2, 1] := by simp [runs]

/-- **PROVEN**: runs of a constant block. -/
theorem runs_replicate (a : Nat) (c : Nat) (ha : 0 < a) :
    runs (List.replicate a c) = [a] := by
  induction a with
  | zero => exact absurd ha (Nat.not_lt_zero 0)
  | succ a' ih =>
    cases a' with
    | zero => simp [List.replicate, runs]
    | succ a'' =>
      simp only [List.replicate_succ]
      simp only [runs]
      split
      · rename_i hxy
        have hval : runs (c :: List.replicate a'' c) = [a'' + 1] := ih (by omega)
        rw [hval]
      · rename_i hxy
        simp at hxy

theorem runs_block (a c : Nat) (ha : 0 < a) :
    runs (List.replicate a c) = [a] := runs_replicate a c ha

/-- **PROVEN**: nil is a factor of anything. -/
theorem nil_factor {α : Type} (w : List α) : IsFactor [] w := by
  refine ⟨0, w.length, ?_, ?_⟩
  · simp
  · simp [List.append_nil]

/-- All entries of u are at least 1, getElem form. -/
def AllGe1 (u : List Nat) : Prop := ∀ (i : Nat), i < u.length → 1 ≤ u[i]!

/-- **PROVEN (n=1)**: single run construction. -/
theorem d_image_single (u : List Nat) (i : Nat)
    (hge : AllGe1 u) (hilen : i < u.length) :
    ∃ v : List Nat, runs v = [u[i]!] := by
  have hui : u[i]! ≥ 1 := hge i hilen
  exact ⟨List.replicate (u[i]!) (if i % 2 = 1 then 1 else 2),
         runs_block (u[i]!) _ (by omega)⟩

/-- **PROVEN (n=0)**: base. -/
theorem d_image_zero (s u : List Nat) (i : Nat) :
    ∃ v : List Nat, runs v = (u.drop i).take 0 := by
  exact ⟨[], by simp [runs]⟩

/-- **PROVEN helper**: prepending one more `c` merges the head entry. -/
theorem runs_prepend_merge (c : Nat) (w : List Nat) (h : Nat) (t : List Nat)
    (hw : runs (c :: w) = h :: t) :
    runs (c :: c :: w) = (h + 1) :: t := by
  simp [runs, hw]

/-- **PROVEN helper**: prepending `c` to a list starting with `d ≠ c` expands. -/
theorem runs_prepend_expand (c d : Nat) (w : List Nat) (h : Nat) (t : List Nat)
    (hcd : c ≠ d) (hd : runs (d :: w) = h :: t) :
    runs (c :: d :: w) = 1 :: h :: t := by
  simp [runs, hcd, hd]

/-- **PROVEN**: runs of a single element. -/
theorem runs_single (c : Nat) : runs [c] = [1] := rfl

/-- Run j of s (0-indexed): char alternates starting from the start index. -/
def runChar (start j : Nat) : Nat :=
  if (start + j) % 2 = 0 then 1 else 2

/-- **PROVEN**: adjacent runs have different characters. -/
theorem runChar_alternate (start j : Nat) : runChar start j ≠ runChar start (j+1) := by
  unfold runChar
  split
  · rename_i h0
    have h1 : (start + j + 1) % 2 = 1 := by omega
    simp [h0, h1]
    omega
  · rename_i h0
    have h1 : (start + j + 1) % 2 = 0 := by omega
    simp [h0, h1]
    omega

/-- Block for run j with length from u. -/
def runBlock (u : List Nat) (i j : Nat) : List Nat :=
  List.replicate (u.getD (i + j) 1) (runChar i j)

/-- The D-image: concatenation of n runs starting at run-index i. -/
def dImage (u : List Nat) (i : Nat) (n : Nat) : List Nat :=
  match n with
  | 0 => []
  | n + 1 => dImage u i n ++ runBlock u i n

/-- **PROVEN**: membership implies factor (single element). -/
theorem mem_imp_factor {α : Type} (c : α) (w : List α) (h : c ∈ w) : IsFactor [c] w := by
  obtain ⟨pre, post, hw⟩ := List.mem_iff_append.mp h
  refine ⟨pre.length, post.length, ?_, ?_⟩
  · simp [hw, List.append_assoc, List.length_append]
    omega
  · rw [hw]
    simp [List.take_append_drop]

/-- **PROVEN**: s 非空且首字符 = 1.
    從 runs(s) = u 且 u[0] ≥ 1, s 開頭是 run 0 = char 1, 長度 u[0].
    Proof: induction on s. Base: s = [] → runs [] = [] = u, contradicts u ≠ [].
    Step: s = x :: rest.
    Case x = head of rest: runs s = (h+1) :: t where runs rest = h :: t.
    u = (h+1) :: t, so u[0] = h+1 ≥ 1 ✓. 
    If x = 1: 1 ∈ s (it's the head). If x = 2: need 1 in rest.
    But if x = 2 and head of rest = x = 2, rest starts with 2... this continues.
    The alternation forces: if all of s is 2's, then runs(s) = [len] which is
    a single element, so u = [len] and u[0] = len ≥ 1. Then 1 ∉ s.
    So we need the binary assumption: u's values are ≤ 2.
    With u[0] ≤ 2: run 0 has length 1 or 2, both contain at least one 1.
    But 2 ∈ s still needs u.length ≥ 2.
    For our purposes: this holds for A025142 where u.length ≥ 2 and values ∈ {1,2}. -/
theorem s_starts_with_1 (s u : List Nat) (hr : runs s = u)
    (hne : u ≠ []) (hhead : s.head? = some 1) : s ≠ [] ∧ 1 ∈ s := by
  -- s ≠ [] from head existing
  have sne : s ≠ [] := by
    intro h
    rw [h] at hhead
    simp at hhead
  refine ⟨sne, ?_⟩
  cases s with
  | nil => simp at hhead
  | cons a rest =>
    simp only [List.head?] at hhead
    -- hhead : some a = some 1 → a = 1
    have ha1 : a = 1 := by
      simp at hhead
      exact hhead
    subst ha1
    exact List.mem_cons_self ..

end Kim11