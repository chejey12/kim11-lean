namespace Kim11

/-- The run of character c with length a, followed by a different-character rest w. -/
theorem runs_replicate_cons (a : Nat) (c : Nat) (w : List Nat)
    (ha : 0 < a) (hw : w = [] ∨ ∃ h t, w = h :: t ∧ h ≠ c) :
    runs (List.replicate a c ++ w) = a :: runs w := by
  induction a with
  | zero => exact absurd ha (Nat.not_lt_zero 0)
  | succ a' ih =>
    cases a' with
    | zero =>
      -- a = 1: replicate 1 c ++ w = c :: w
      cases w with
      | nil => simp [runs]
      | cons h t =>
        -- c ≠ h
        simp [List.replicate, ih, List.cons_append, runs]
        intro hh
        exact absurd (by simp_all) hh
    | succ a'' =>
      -- a = a'' + 2 ≥ 2
      cases hw' : List.replicate a'' c ++ w with
      | nil =>
        -- a'' ≥ 1 forces nonempty, contradiction unless a''=0 and w=[]
        -- if a'' = 0 then replicate 0 c ++ w = w = [] contradicts hw
        cases a'' with
        | zero => exfalso; exact absurd hw (by
            intro hh
            rcases hh with rfl | ⟨h, t, hrfl, _⟩
            · exact Nat.lt_irrefl 0 (Nat.lt_of_lt_of_eq (by decide) (by simp [List.replicate 0 c]))
            · simp [List.replicate 0 c] at *)
        | succ a3 =>
          simp [List.replicate_succ] at hw
          -- replicate (a3+1) c = c :: replicate a3 c, so the concatenation can't be nil
          exfalso
          simp_all
      | y :: rest =>
        simp [List.replicate_succ, runs]
        -- replicate (a''+1) c ++ w = c :: (replicate a'' c ++ w) = c :: (y :: rest)
        -- runs (c :: y :: rest): if c = y, head-merge; else head-expand
        have hcy : c = y ∨ c ≠ y := by
          by_cases h : c = y
          · exact Or.inl h
          · exact Or.inr h
        rcases hcy with heq | hne
        · rw [if_pos heq]
          -- runs (y :: rest) = a'' :: runs w by IH (0 < a''+1... need IH)
          have hih := ih ha (by simp [List.replicate_succ] at *; omega)
          rw [hih]
          simp
        · simp [runs, hne, List.replicate_succ] at *

end Kim11
