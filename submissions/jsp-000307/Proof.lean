/-
Copyright (c) 2026 The Formal Conjectures Authors, Omicron0314.
Released under Apache 2.0. Prepared with OpenAI Codex assistance.
-/
import Mathlib.Data.Nat.Factors
import Mathlib.Tactic

/-!
# JSP-000307 / Erdos problem: consecutive integers, decreasing largest prime factors

Question: can three consecutive integers have strictly decreasing largest
prime factors?  Answer: yes; for `13, 14, 15` the largest prime factors are
`13, 7, 5`, strictly decreasing.  The witness factorization:

- `13 = 13` (prime),
- `14 = 2 * 7`,
- `15 = 3 * 5`.

Known to Erdős and Pomerance (1978); this file supplies a machine-checkable
Lean proof and claims no mathematical discovery.  The final theorem preserves
the quantifier structure of the original yes/no question.
-/

namespace JSP000307

/-- The largest prime factor of `n`, the maximum of Mathlib's sorted list of
prime factors (`0` for `n = 0, 1`, where the list is empty). -/
def largestPrimeFactor (n : ℕ) : ℕ := n.primeFactorsList.foldr max 0

/-- The factorization `13 = 13`. -/
lemma primeFactorsList_13 : (13 : ℕ).primeFactorsList = [13] := by
  exact Nat.primeFactorsList_prime (by norm_num)

/-- The factorization `14 = 2 · 7`. -/
lemma primeFactorsList_14 : (14 : ℕ).primeFactorsList = [2, 7] := by
  norm_num [Nat.primeFactorsList]

/-- The factorization `15 = 3 · 5`. -/
lemma primeFactorsList_15 : (15 : ℕ).primeFactorsList = [3, 5] := by
  norm_num [Nat.primeFactorsList]

/-- The largest prime factor of `13` is `13`. -/
lemma largestPrimeFactor_13 : largestPrimeFactor 13 = 13 := by
  norm_num [largestPrimeFactor, Nat.primeFactorsList]

/-- The largest prime factor of `14` is `7`. -/
lemma largestPrimeFactor_14 : largestPrimeFactor 14 = 7 := by
  norm_num [largestPrimeFactor, Nat.primeFactorsList]

/-- The largest prime factor of `15` is `5`. -/
lemma largestPrimeFactor_15 : largestPrimeFactor 15 = 5 := by
  norm_num [largestPrimeFactor, Nat.primeFactorsList]

/-- For `13, 14, 15` the largest prime factors strictly decrease:
`13 > 7 > 5`. -/
theorem decreasing_largestPrimeFactor_13_14_15 :
    largestPrimeFactor 13 > largestPrimeFactor 14 ∧
    largestPrimeFactor 14 > largestPrimeFactor 15 := by
  rw [largestPrimeFactor_13, largestPrimeFactor_14, largestPrimeFactor_15]
  norm_num

/-- **The formal answer to JSP-000307.** There exist three consecutive integers
whose largest prime factors are strictly decreasing; the witness is
`n = 13`, with `largestPrimeFactor 13 = 13 > 7 = largestPrimeFactor 14`
and `largestPrimeFactor 14 = 7 > 5 = largestPrimeFactor 15`. -/
theorem threeConsecutiveWithDecreasingP :
    ∃ n : ℕ,
      largestPrimeFactor n > largestPrimeFactor (n + 1) ∧
      largestPrimeFactor (n + 1) > largestPrimeFactor (n + 2) := by
  refine ⟨13, ?_⟩
  exact decreasing_largestPrimeFactor_13_14_15

#print axioms largestPrimeFactor_13
#print axioms largestPrimeFactor_14
#print axioms largestPrimeFactor_15
#print axioms threeConsecutiveWithDecreasingP

end JSP000307
