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

/-- **Key concat lemma**: prepending one more `c` before a list whose head
    is also `c` merges the head entry.
    If `runs w = h :: t` where the head char of `w` is `c`,
    then `runs (c :: w) = (h+1) :: t`.
    Here "head char of w is c" is encoded as: `runs (c :: tail) = h :: t` for some t. -/
theorem runs_prepend_merge (c : Nat) (w : List Nat) (h : Nat) (t : List Nat)
    (hw : runs (c :: w) = h :: t) :
    runs (c :: c :: w) = (h + 1) :: t := by
  simp [runs, hw]

/-- **Key concat lemma 2**: prepending `c` to a list whose head char is `d ≠ c`
    expands the first run entry.
    If `runs (d :: w) = h :: t` with `d ≠ c`, then `runs (c :: d :: w) = 1 :: h :: t`. -/
theorem runs_prepend_expand (c d : Nat) (w : List Nat) (h : Nat) (t : List Nat)
    (hcd : c ≠ d) (hd : runs (d :: w) = h :: t) :
    runs (c :: d :: w) = 1 :: h :: t := by
  simp [runs, hcd, hd]

/-- **PROVEN**: runs of a single element. -/
theorem runs_single (c : Nat) : runs [c] = [1] := rfl

/-- **Tracked obligation**: the general induction step of d_image_aligned
    (n ≥ 2 requires the concat structure of run sequences). -/
theorem d_image_step : ∀ (n : Nat) (s u : List Nat) (i : Nat),
    runs s = u → AllGe1 u → n ≤ u.length → i + n ≤ u.length →
    ∃ v : List Nat, runs v = (u.drop i).take (n + 1) := by
  intro n s u i _ _ _ _
  sorry

/-- **Main conjecture (finite form)**: base k=0 proven; k≥1 tracked. -/
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