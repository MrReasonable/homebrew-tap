# MrReasonable/homebrew-tap

A [Homebrew](https://brew.sh) tap for [`job-sluice`](https://github.com/MrReasonable/sluice).

```bash
brew install MrReasonable/tap/job-sluice
```

## This tap is machine-maintained

`Formula/job-sluice.rb` is **generated, never hand-edited**. It is rendered from release
metadata by [`scripts/render_homebrew_formula.py`](https://github.com/MrReasonable/sluice/blob/main/scripts/render_homebrew_formula.py)
in the sluice repository, and its resource stanzas are filled by `brew update-python-resources`.

Every bump is verified before it lands here: the release workflow runs `brew audit --strict`,
`brew install --build-from-source` and `brew test` against the rendered formula, and pushes
only if all of them pass. A hand edit will be overwritten by the next release.

To change the formula, change the renderer.
