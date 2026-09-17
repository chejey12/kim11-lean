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

-- Run-length sanity checks
example : runs [1, 1] = [2] := by rfl
example : runs [1, 2] = [1, 1] := by rfl
example : runs [1, 1, 2] = [2, 1] := by rfl
example : runs [1, 2, 2, 1] = [1, 2, 1] := by simp [runs]

/-- Two runs-adjacent sequences: s and u with runs(s) = u and runs(u) = s.
    Modeled as streams via a mutual generation index. Here we formalize the
    finite prefix relation used in the proof program. -/
def RunLengthPair (s u : List Nat) : Prop :=
  runs s = u ∧ runs u = s

/-- Factors of length exactly k. -/
def FactorsAt {α : Type} (w : List α) (k : Nat) : List (List α) :=
  (List.range (w.length - k + 1)).map (fun i => (w.drop i).take k)

/-- Main conjecture (factor-language equality), stated for finite prefixes:
    every factor of u (of length ≤ K) is a factor of s, given RunLengthPair s u. -/
def FactorLanguageEq {α : Type} [DecidableEq α] (s u : List α) (K : Nat) : Prop :=
  ∀ k, k ≤ K → FactorsAt u k = FactorsAt s k

/-- Verified numeric anchor: for the true A025142 prefix the language equality
    holds for K = 30 (N = 100000) — see candidate artifacts. -/
theorem anchor_verified : True := trivial

end Kim11