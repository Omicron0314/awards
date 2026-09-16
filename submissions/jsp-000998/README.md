# JSP-000998 / Erdős #1193: complete density counterexample formalization

## English

This package submits a complete Lean proof of the two **negative** answers in
[JSP-000998](../../problems/catalog-0901-1000.md#JSP-000998) (Erdős problem 1193)
for intake and eligibility review. For `A = ℕ` and `g(n) = n + 1`, every natural
number has exactly `g(n)` ordered additive representations, so the matching set has
lower and upper natural density one. This contradicts both proposed conclusions.

The counterexample and an earlier Lean proof are already public and credited to
Pietro Monticone / Aristotle, as recorded in the problem catalog. This submission
claims neither mathematical discovery nor first formalization. Its additional work
is to connect the representation count to the indicator convolution and to formally
prove, in a pinned reproducible Lean/Mathlib 4.34.0 project:

- that the representation count equals the indicator convolution;
- that the matching set has both natural densities equal to one;
- both fully quantified negative answers (no universal real bound strictly below one).

OpenAI Codex assisted proof construction, checking, and submission preparation.
This is a self-submission by the PR author, who has a direct interest in the
outcome; local checks are not independent review.

## Contents

| File | Purpose |
| --- | --- |
| `Proof.lean` | Standalone Lean proof (namespace `JSP000998`), the four audited declarations below. |
| `VERIFICATION.md` | Local verification evidence, toolchain versions, and documented limitations. |
| `verify.sh` | Reproduction script (build, warning-as-error, prohibited-token scan, bundled `leanchecker`). |
| `lakefile.toml` / `lake-manifest.json` | Pinned Mathlib `v4.34.0` dependency configuration. |
| `lean-toolchain` | Pinned Lean `4.34.0`. |
| `.gitignore` | Ignore the local `.lake` build cache. |

## Fixed proof and immutable evidence

Immutable proof repository: [Omicron0314/lean_syc_proofs](https://github.com/Omicron0314/lean_syc_proofs).
Pinned source commit: `b1f5c047f000b90d356048f5e91ef90e7768e3a3`.

- [Lean source (namespace `LeanSyc.JSP000998`)](https://github.com/Omicron0314/lean_syc_proofs/blob/b1f5c047f000b90d356048f5e91ef90e7768e3a3/LeanSyc/JSP000998.lean)
- [Statement correspondence and attribution](https://github.com/Omicron0314/lean_syc_proofs/blob/b1f5c047f000b90d356048f5e91ef90e7768e3a3/STATEMENT.md)
- [Pinned dependency manifest](https://github.com/Omicron0314/lean_syc_proofs/blob/b1f5c047f000b90d356048f5e91ef90e7768e3a3/lake-manifest.json)
- [Reproduction script](https://github.com/Omicron0314/lean_syc_proofs/blob/b1f5c047f000b90d356048f5e91ef90e7768e3a3/scripts/verify.sh)
- [Compiler and checker transcript](https://github.com/Omicron0314/lean_syc_proofs/blob/b1f5c047f000b90d356048f5e91ef90e7768e3a3/evidence/verification.txt)
- [Source checksums](https://github.com/Omicron0314/lean_syc_proofs/blob/b1f5c047f000b90d356048f5e91ef90e7768e3a3/evidence/SHA256SUMS)
- [Apache 2.0 license](https://github.com/Omicron0314/lean_syc_proofs/blob/b1f5c047f000b90d356048f5e91ef90e7768e3a3/LICENSE)

The `Proof.lean` in this directory is a self-contained copy (namespace `JSP000998`)
whose theorem logic is identical to the pinned source (namespace
`LeanSyc.JSP000998`).

## Reproduction

```sh
cd submissions/jsp-000998
lake exe cache get   # requires network; set proxy env vars if necessary
bash verify.sh
```

For the full immutable project (includes the project-wide source scan across
`LeanSyc/*.lean`):

```sh
git clone https://github.com/Omicron0314/lean_syc_proofs.git
cd lean_syc_proofs
git checkout b1f5c047f000b90d356048f5e91ef90e7768e3a3
lake exe cache get
bash scripts/verify.sh
sha256sum -c evidence/SHA256SUMS
```

Requires elan and Python 3. Lean is pinned to `4.34.0`, Mathlib to
`v4.34.0` (commit `5ed2965256430c3649e86755f9576b54eca72435`).

Audited declarations (in `Proof.lean`, namespace `JSP000998`; in the pinned project,
namespace `LeanSyc.JSP000998`):

- `sumRep_eq_indicator_convolution`
- `density_one_counterexample`
- `not_lower_density_zero`
- `not_uniform_upper_density_bound`

All four report exactly `[propext, Classical.choice, Quot.sound]`.
`lake build --wfail`, direct compilation with warnings as errors, a prohibited-token
scan of the Lean source, and bundled `leanchecker` replay passed locally.
The bundled checker uses the same Lean kernel; it is not an independent checker.
Mathlib caches were used, and a network-disabled rebuild of dependencies was not
performed. GitHub commit links are pinned but do not constitute an independently
preserved permanent archive; permanent archival remains pending if required.

## Record or policy impact

This submits evidence for review only. It does not change catalog eligibility,
candidate or award records, recipient profiles, or curator/verifier attestations.
`submissions/` is a proposed intake location because the repository does not yet
document a dedicated formal-proof submission directory; please redirect the package
if another path or repository is required. No candidate YAML is created: formal
candidate statements require actual registered curator and verifier signatures under
`docs/records.md` and the statement schema; none are asserted or manufactured here.

## Attribution and review requested

The catalog credits Pietro Monticone for the public solution and Lean proof. The
[earlier source](https://github.com/plby/lean-proofs/blob/1268917deaaaa0d674f651287027baa26cea9920/src/latest/ErdosProblems/Erdos1193.lean)
credits Pietro Monticone and Aristotle (Harmonic). Their prior work is explicitly
acknowledged. The original discoverer is not established here. Statement and
definition adaptations credit The Formal Conjectures Authors under Apache 2.0.

The proposed formalization contributor is the placeholder
`RECIPIENT-jsp-000998-A`, confirmation pending. This is a self-submission. No
solver credit, first-formalization priority, award tier, payment, or official
claim transition is asserted. Repository CI checks records and structure; it does
not execute this external proof or certify mathematical acceptance.
