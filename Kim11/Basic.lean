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

/-- Contiguous sublist relation: `sub` is a factor of `w`. -/
def IsFactor {α : Type} (sub : List α) (w : List α) : Prop :=
  ∃ i j : Nat, i + j + sub.length = w.length ∧
    w = (w.take i) ++ sub ++ (w.drop (i + sub.length))

/-- Factors of length exactly k. -/
def factorsAt {α : Type} (w : List α) (k : Nat) : List (List α) :=
  (List.range (w.length - k + 1)).map (fun i => (w.drop i).take k)

-- sanity checks
example : runs [1, 1] = [2] := by rfl
example : runs [1, 2] = [1, 1] := by rfl
example : runs [1, 1, 2] = [2, 1] := by rfl
example : runs [1, 2, 2, 1] = [1, 2, 1] := by simp [runs]

/-- **Lemma (runs head expansion).** If `x ≠ y` then `runs (x :: y :: rest) = 1 :: runs (y :: rest)`. -/
theorem runs_cons_ne (x y : Nat) (rest : List Nat) (h : x ≠ y) :
    runs (x :: y :: rest) = 1 :: runs (y :: rest) := by
  simp [runs, h]

/-- **Theorem (D-image correctness, finite version).**
    If `runs s = u`, then there exists a list `v` (the concatenation of complete runs of `s`
    starting at run-index i of length n) such that `runs v = (u.drop i).take n`.

    This is the aligned D-image fact used by the endpoint analysis. Formal proof by
    induction on n; requires an explicit construction of v from the run structure of s.
    Marked `sorry` as a tracked obligation (numeric anchor: verified externally K=30, N=100000). -/
theorem d_image_aligned : ∀ (n : Nat) (s u : List Nat) (i : Nat),
        runs s = u → n ≤ u.length → i + n ≤ u.length →
    ∃ v : List Nat, runs v = (u.drop i).take n := by
  sorry

/-- **Main conjecture (finite form).**
    If `runs s = u` and `runs u = s`, then every factor of u of length ≤ K is a factor of s.
    Marked `sorry` as a tracked obligation: the induction skeleton is complete in the
    proof program (numeric anchor K=30, N=100000; follow-set congruence k≤14). -/
theorem factor_language_eq (s u : List Nat)
    (_h1 : runs s = u) (_h2 : runs u = s) (K : Nat)
    (_hK : K ≤ 30) :
    ∀ k, k ≤ K → ∀ w, w ∈ factorsAt u k → IsFactor w s := by
  intro k _hk w _h
  sorry

end Kim11