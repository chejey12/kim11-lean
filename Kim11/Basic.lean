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

-- sanity checks (all compile)
example : runs [1, 1] = [2] := by rfl
example : runs [1, 2] = [1, 1] := by rfl
example : runs [1, 1, 2] = [2, 1] := by rfl
example : runs [1, 2, 2, 1] = [1, 2, 1] := by simp [runs]

/-- **PROVEN** Key helper: runs of a constant block of length a ≥ 1 is [a]. -/
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

/-- **Tracked obligation 1**: D-image aligned fact (numeric anchor K=30, N=100000). -/
theorem d_image_aligned : ∀ (n : Nat) (s u : List Nat) (i : Nat),
    runs s = u → n ≤ u.length → i + n ≤ u.length →
    ∃ v : List Nat, runs v = (u.drop i).take n := by
  intro n
  induction n with
  | zero => intro s u i _ _ _; exact ⟨[], by simp [runs]⟩
  | succ n ih =>
      intro s u i hr hu hi
      sorry

/-- **Tracked obligation 2** (main conjecture, finite form). -/
theorem factor_language_eq (s u : List Nat)
    (h1 : runs s = u) (h2 : runs u = s) (K : Nat) (hK : K ≤ 30) :
    ∀ k, k ≤ K → ∀ w, w ∈ factorsAt u k → IsFactor w s := by
  intro k hk w hw
  sorry

end Kim11