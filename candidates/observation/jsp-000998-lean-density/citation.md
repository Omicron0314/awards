# JSP-000998 Lean density formalization — draft candidate

## English

This is a preliminary candidate record under review, not an announced award.

JSP-000998 asks two density questions about the set of natural numbers `n` for
which the ordered additive representation count of a set `A` equals a prescribed
positive monotone function `g(n)`. The submitted Lean development takes
`A = ℕ` and `g(n) = n + 1`, proves that every natural number matches, and derives
that both the lower and upper natural densities of the matching set are one.
It then proves the fully quantified negative answer to each question.

The elementary counterexample and an earlier Lean proof are already public and
credited to Pietro Monticone / Aristotle in the
[problem-bank record](../../../problems/catalog-0901-1000.md#JSP-000998).
The candidate does not claim mathematical discovery or first formalization.
The submitted contribution is the explicit indicator-convolution correspondence,
the completed lower- and upper-density arguments, both quantified negations, and
a pinned reproducible Lean/Mathlib project.

Public evidence:

- [Pinned proof repository](https://github.com/Omicron0314/lean_syc_proofs/tree/b1f5c047f000b90d356048f5e91ef90e7768e3a3)
- [Statement correspondence and attribution](https://github.com/Omicron0314/lean_syc_proofs/blob/b1f5c047f000b90d356048f5e91ef90e7768e3a3/STATEMENT.md)
- [Reproduction log](https://github.com/Omicron0314/lean_syc_proofs/blob/b1f5c047f000b90d356048f5e91ef90e7768e3a3/evidence/verification.txt)
- [Self-contained intake copy](../../../submissions/jsp-000998/README.md)

Formal verification, statement-equivalence review, recipient confirmation, and
independent review remain pending. OpenAI Codex assisted preparation and local
checking; those checks are not independent review.
