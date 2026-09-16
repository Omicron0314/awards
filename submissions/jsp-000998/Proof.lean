/-
Copyright (c) 2026 The Formal Conjectures Authors, Omicron0314.
Released under Apache 2.0. Prepared with OpenAI Codex assistance.
-/
import Mathlib.Data.Finset.NatAntidiagonal
import Mathlib.Order.Interval.Set.Nat
import Mathlib.Topology.Instances.Real.Lemmas
import Mathlib.Tactic

/-!
# JSP-000998 / Erdos problem 1193

Natural numbers include zero. Ordered pairs `(a,b)` with `a+b=n` are counted,
including diagonal pairs. Densities are the real liminf/limsup of
`|S ∩ [0,N)| / N` as `N` tends to infinity.

The counterexample `A = ℕ`, `g(n) = n+1` is known and was formalized earlier by
Pietro Monticone / Aristotle. This version explicitly proves both density-one
conclusions and both fully quantified negative answers. It claims neither
mathematical discovery nor first formalization.
-/

namespace JSP000998

open Filter

noncomputable def sumRep (A : Set ℕ) (n : ℕ) : ℕ := by
  classical
  exact ((Finset.antidiagonal n).filter fun p => p.1 ∈ A ∧ p.2 ∈ A).card

noncomputable def partialDensity (S : Set ℕ) (N : ℕ) : ℝ :=
  (S ∩ Set.Iio N).ncard / (N : ℝ)

noncomputable def lowerDensity (S : Set ℕ) : ℝ :=
  atTop.liminf (partialDensity S)

noncomputable def upperDensity (S : Set ℕ) : ℝ :=
  atTop.limsup (partialDensity S)

theorem sumRep_eq_indicator_convolution (A : Set ℕ) (n : ℕ) :
    sumRep A n = ∑ p ∈ Finset.antidiagonal n,
      A.indicator (fun _ => (1 : ℕ)) p.1 * A.indicator (fun _ => (1 : ℕ)) p.2 := by
  classical
  simp only [sumRep, Finset.card_filter, Set.indicator_apply]
  apply Finset.sum_congr rfl
  intro p _
  split_ifs <;> simp_all

@[simp] theorem sumRep_univ (n : ℕ) : sumRep Set.univ n = n + 1 := by
  simp [sumRep]

theorem matching_set_univ : {n : ℕ | sumRep Set.univ n = n + 1} = Set.univ := by
  ext n
  simp

theorem partialDensity_univ_eventually :
    partialDensity Set.univ =ᶠ[atTop] fun _ => (1 : ℝ) := by
  filter_upwards [eventually_gt_atTop (0 : ℕ)] with N hN
  simp [partialDensity, ne_of_gt hN]

@[simp] theorem lowerDensity_univ : lowerDensity Set.univ = 1 := by
  rw [lowerDensity, Filter.liminf_congr partialDensity_univ_eventually]
  exact Filter.liminf_const _

@[simp] theorem upperDensity_univ : upperDensity Set.univ = 1 := by
  rw [upperDensity, Filter.limsup_congr partialDensity_univ_eventually]
  exact Filter.limsup_const _

theorem density_one_counterexample :
    ∃ (A : Set ℕ) (g : ℕ → ℕ), Monotone g ∧ (∀ n, 0 < g n) ∧
      lowerDensity {n | sumRep A n = g n} = 1 ∧
      upperDensity {n | sumRep A n = g n} = 1 := by
  refine ⟨Set.univ, fun n => n + 1, ?_, ?_, ?_, ?_⟩
  · intro a b hab
    exact Nat.add_le_add_right hab 1
  · intro n
    exact Nat.succ_pos n
  · rw [matching_set_univ, lowerDensity_univ]
  · rw [matching_set_univ, upperDensity_univ]

theorem not_lower_density_zero :
    ¬ ∀ (A : Set ℕ) (g : ℕ → ℕ), Monotone g → (∀ n, 0 < g n) →
      lowerDensity {n | sumRep A n = g n} = 0 := by
  obtain ⟨A, g, hmono, hpos, hlo, _⟩ := density_one_counterexample
  intro h
  have hz := h A g hmono hpos
  rw [hlo] at hz
  norm_num at hz

theorem not_uniform_upper_density_bound :
    ¬ ∃ c < (1 : ℝ), ∀ (A : Set ℕ) (g : ℕ → ℕ), Monotone g →
      (∀ n, 0 < g n) → upperDensity {n | sumRep A n = g n} < c := by
  obtain ⟨A, g, hmono, hpos, _, hup⟩ := density_one_counterexample
  rintro ⟨c, hc, h⟩
  have hlt := h A g hmono hpos
  rw [hup] at hlt
  exact (lt_asymm hc hlt)

#print axioms sumRep_eq_indicator_convolution
#print axioms density_one_counterexample
#print axioms not_lower_density_zero
#print axioms not_uniform_upper_density_bound

end JSP000998
