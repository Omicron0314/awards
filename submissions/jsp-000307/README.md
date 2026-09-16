# JSP-000307 / Erdős–Pomerance: decreasing largest prime factors of consecutive integers

## English

This package submits the **first Lean formalization** of
[JSP-000307](../../problems/catalog-0301-0400.md#JSP-000307) for intake and
eligibility review. The question: *can three consecutive integers have strictly
decreasing largest prime factors?* The affirmative witness is `13, 14, 15`:

- `13 = 13` (prime), `14 = 2 · 7`, `15 = 3 · 5`,
- so `largestPrimeFactor 13 = 13 > 7 = largestPrimeFactor 14`,
- and `largestPrimeFactor 14 = 7 > 5 = largestPrimeFactor 15`.

At the time of writing the catalog records `Solved`, `Lean proof: No`,
`Eligible to claim: No`, `Claim status: Unavailable`. This submission
provides the missing Lean proof and a faithful, quantifier-preserving
formalization of the original question
(`threeConsecutiveWithDecreasingP`). It claims **no mathematical discovery** —
the witness is known to Erdős and Pomerance (1978) — and no first-solution
priority; the claimed contribution is the machine-checkable Lean proof of the
answered question and the reproducible verification package.

OpenAI Codex assisted proof construction, checking, and submission preparation.
This is a self-submission by the PR author, who has a direct interest in the
outcome; local checks are not independent review.

## Contents

| File | Purpose |
| --- | --- |
| `Proof.lean` | Standalone Lean proof (namespace `JSP000307`), declarations listed below. |
| `VERIFICATION.md` | Local verification evidence, toolchain versions, and documented limitations. |
| `verify.sh` | Reproduction script (build, warning-as-error, prohibited-token scan, bundled `leanchecker`). |
| `lakefile.toml` / `lake-manifest.json` | Pinned Mathlib `v4.34.0` dependency configuration. |
| `lean-toolchain` | Pinned Lean `4.34.0`. |
| `.gitignore` | Ignore the local `.lake` build cache. |

## Fixed proof and immutable evidence

Immutable proof repository: [Omicron0314/lean_syc_proofs](https://github.com/Omicron0314/lean_syc_proofs).
Pinned source commit: `31566b39019e45598eedc3b7197311ea7ac1a202`.

- [Lean source (namespace `LeanSyc.JSP000307`)](https://github.com/Omicron0314/lean_syc_proofs/blob/31566b39019e45598eedc3b7197311ea7ac1a202/LeanSyc/JSP000307.lean)
- [Statement correspondence and attribution](https://github.com/Omicron0314/lean_syc_proofs/blob/31566b39019e45598eedc3b7197311ea7ac1a202/STATEMENT-307.md)
- [Pinned dependency manifest](https://github.com/Omicron0314/lean_syc_proofs/blob/31566b39019e45598eedc3b7197311ea7ac1a202/lake-manifest.json)
- [Reproduction script](https://github.com/Omicron0314/lean_syc_proofs/blob/31566b39019e45598eedc3b7197311ea7ac1a202/scripts/verify.sh)
- [Compiler and checker transcript](https://github.com/Omicron0314/lean_syc_proofs/blob/31566b39019e45598eedc3b7197311ea7ac1a202/evidence/verification.txt)
- [Source checksums](https://github.com/Omicron0314/lean_syc_proofs/blob/31566b39019e45598eedc3b7197311ea7ac1a202/evidence/SHA256SUMS)
- [Apache 2.0 license](https://github.com/Omicron0314/lean_syc_proofs/blob/31566b39019e45598eedc3b7197311ea7ac1a202/LICENSE)

The `Proof.lean` in this directory is a self-contained copy (namespace
`JSP000307`) whose theorem logic is identical to the pinned source (namespace
`LeanSyc.JSP000307`).

## Reproduction

```sh
cd submissions/jsp-000307
lake exe cache get   # requires network; set proxy env vars if necessary
bash verify.sh
```

For the full immutable project (includes the project-wide source scan across
`LeanSyc/*.lean`):

```sh
git clone https://github.com/Omicron0314/lean_syc_proofs.git
cd lean_syc_proofs
git checkout 31566b39019e45598eedc3b7197311ea7ac1a202
lake exe cache get
bash scripts/verify.sh
sha256sum -c evidence/SHA256SUMS
```

Requires elan and Python 3. Lean is pinned to `4.34.0`, Mathlib to
`v4.34.0` (commit `5ed2965256430c3649e86755f9576b54eca72435`).

Audited declarations (in `Proof.lean`, namespace `JSP000307`; in the pinned
project, namespace `LeanSyc.JSP000307`):

- `largestPrimeFactor_13`
- `largestPrimeFactor_14`
- `largestPrimeFactor_15`
- `threeConsecutiveWithDecreasingP`

All report exactly `[propext, Classical.choice, Quot.sound]`.
`lake build --wfail`, direct compilation with warnings as errors, a
prohibited-token scan of the Lean source, and bundled `leanchecker` replay
passed locally. The bundled checker uses the same Lean kernel; it is not an
independent checker. Mathlib caches were used, and a network-disabled rebuild
of dependencies was not performed. GitHub commit links are pinned but do not
constitute an independently preserved permanent archive; permanent archival
remains pending if required.

## Record or policy impact

This submits evidence for review only. At submission time the catalog marks the
problem `Eligible to claim: No` / `Claim status: Unavailable` (no recorded Lean
proof); this package is the proposed first Lean proof. It does not change
catalog eligibility, candidate or award records, recipient profiles, or
curator/verifier attestations. `submissions/` is a proposed intake location
because the repository does not yet document a dedicated formal-proof
submission directory; please redirect the package if another path or
repository is required. No candidate YAML is created: formal candidate
statements require actual registered curator and verifier signatures under
`docs/records.md` and the statement schema; none are asserted or manufactured
here.

## Attribution and review requested

Original references: P. Erdős and C. Pomerance, *On the largest prime factors
of n and n+1*, Aequationes Math. (1978), 311–321; J. Balzarotti, *On triplets
with descending largest prime factors*, Studia Sci. Math. Hungar. (2001),
45–50. The mathematical answer predates this submission; no solver credit is
claimed. The proposed formalization contributor is the placeholder
`RECIPIENT-jsp-000307-A`, confirmation pending. No award tier, payment, or
official claim transition is asserted. Repository CI checks records and
structure; it does not execute this external proof or certify mathematical
acceptance. Please assess statement fidelity and whether the first Lean
formalization of this solved question is eligible for intake.
