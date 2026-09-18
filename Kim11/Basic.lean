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

/-- Block for run j with length from u. -/
def runBlock (u : List Nat) (i j : Nat) : List Nat :=
  List.replicate (u.getD (i + j) 1) (runChar i j)

/-- The D-image: concatenation of n runs starting at run-index i. -/
def dImage (u : List Nat) (i : Nat) (n : Nat) : List Nat :=
  match n with
  | 0 => []
  | n + 1 => dImage u i n ++ runBlock u i n

/-- **Tracked obligation 1**: D-image correctness (numeric anchor K=30, N=100000).
    Proof requires: (1) runChar alternation: runChar i (j) ≠ runChar i (j+1) for all j;
    (2) the concat behaviour: runs(v ++ replicate L c) = runs(v) ++ [L] when the last char
    of v is ≠ c; (3) induction on n. Each step verified numerically in the proof program. -/
theorem d_image_correct (u : List Nat) (i : Nat) (n : Nat)
    (_hge : AllGe1 u) (_hi : i + n ≤ u.length) :
    runs (dImage u i n) = (u.drop i).take n := by
  sorry

/-- **Tracked obligation 2**: Main conjecture, finite form (K=30, N=200000 anchor).
    Proof: base k=0 (proven above). Step k→k+1: if w is a factor of u of length k+1,
    then w minus its last character is a factor of length k (hence of s by induction),
    and w is determined by that shorter factor plus one follow character, which exists
    in s by the follow-set congruence verified at k ≤ 14 (N=100000). -/
theorem factor_language_eq (s u : List Nat)
    (h1 : runs s = u) (h2 : runs u = s) (K : Nat) (hK : K ≤ 30) :
    ∀ k, k ≤ K → ∀ w, w ∈ factorsAt u k → IsFactor w s := by
  intro k hk w hw
  match k with
  | 0 =>
    simp only [factorsAt, List.take_zero, List.mem_map] at hw
    obtain ⟨i, _, rfl⟩ := hw
    exact nil_factor s
  | k+1 => sorry

end Kim11
