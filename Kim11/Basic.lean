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

/-- **PROVEN helper**: nil is a factor of anything. -/
theorem nil_factor {α : Type} (w : List α) : IsFactor [] w := by
  refine ⟨0, w.length, ?_, ?_⟩
  · simp
  · simp [List.append_nil]

/-- **Key structural lemma**: runs of a single char list.
    runs [c] = [1]. -/
theorem runs_single (c : Nat) : runs [c] = [1] := rfl

/-- **PROVEN helper**: prepending one more `c` to a list starting with `c`
    increments the first entry of its run-length encoding. -/
theorem runs_cons_merge (c : Nat) (w : List Nat) (h : Nat) (t : List Nat)
    (hw : runs (c :: w) = h :: t) :
    runs (c :: c :: w) = (h + 1) :: t := by
  simp [runs, hw]

end Kim11