# JSP-000998 — completed density conclusions for operator review

## English

This intake package contains a complete Lean proof of both negative answers in
[JSP-000998](../../problems/catalog-0901-1000.md#JSP-000998), corresponding to
Erdős problem 1193. For `A = ℕ` and `g(n) = n + 1`, every natural number has
exactly `g(n)` ordered additive representations, so the matching set has lower
and upper natural density one.

The counterexample and an earlier Lean proof are already public and credited to
Pietro Monticone / Aristotle in the problem catalog. This submission claims
neither mathematical discovery nor first formalization. Its additional work is
to connect the representation count to indicator convolution and formally prove
both density-one conclusions and both full quantified negations in a pinned,
reproducible Mathlib project. OpenAI Codex assisted preparation.

### Source and reproduction

- [Proof source](Proof.lean), [toolchain](lean-toolchain),
  [locked dependencies](lake-manifest.json), and [verification script](verify.sh).
- [Local verification evidence and limitations](VERIFICATION.md).
- [Immutable proof repository](https://github.com/Omicron0314/lean_syc_proofs/tree/b1f5c047f000b90d356048f5e91ef90e7768e3a3).
- [Detailed statement correspondence and attribution](https://github.com/Omicron0314/lean_syc_proofs/blob/b1f5c047f000b90d356048f5e91ef90e7768e3a3/STATEMENT.md).
- [Local reproduction log](https://github.com/Omicron0314/lean_syc_proofs/blob/b1f5c047f000b90d356048f5e91ef90e7768e3a3/evidence/verification.txt).

Run `lake exe cache get` and then `bash verify.sh` in this directory. Lean is
4.34.0 and Mathlib is pinned to commit
`5ed2965256430c3649e86755f9576b54eca72435`.

### Requested review

Please assess statement fidelity and whether the explicit density conclusions,
quantified answers, and reproducibility work constitute an eligible formalization
or verification contribution despite the acknowledged prior Lean proof. This
`submissions/` path follows the currently open JSP-000301 intake PR and is a
proposed route, not an assertion that an official intake process has been fixed.

No candidate YAML is created: its statement and verification records require
authorized curator/verifier signatures. No solver credit, first-formalization
priority, award tier, payment, or official claim transition is asserted.

Proposed formalization contributor: `RECIPIENT-jsp-000998-A`, confirmation
pending. This is a self-submission; local checks are not independent review.
