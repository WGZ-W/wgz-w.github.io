# Repository Guidelines

## Project Structure & Module Organization

This repository is an MkDocs Material documentation site. All published content lives in `docs/`; `docs/index.md` is the site landing page, and topic folders such as `docs/Study/`, `docs/Blogs/`, `docs/Paper-Reading/`, and `docs/Vim/` group related notes. Store static site assets in `docs/img/`. Configure the site theme, plugins, navigation, and URL in `mkdocs.yml`. GitHub Actions deployment is defined in `.github/workflows/deploy.yml`.

Keep new pages near their subject area. For example, add a Linux tooling note as `docs/Study/Linux/Tools/<topic>.md`; create an `index.md` when introducing a new section.

## Build, Test, and Development Commands

Install the only required local dependency with:

```powershell
python -m pip install mkdocs-material
```

Use `mkdocs serve` to run a local preview with automatic reloads. Run `mkdocs build --strict` before submitting changes; it renders the site and treats warnings, including broken internal links, as failures. The deployment workflow runs `mkdocs gh-deploy --force` after pushes to `main` or `master`; contributors should not run that command for ordinary changes.

## Writing Style & Naming Conventions

Write pages in Markdown with one top-level `#` heading followed by logical `##` sections. Use concise, descriptive, lowercase kebab-case filenames, such as `how-to-read-paper.md`; retain established capitalization for existing directories. Prefer relative links between documents and place images under `docs/img/` with meaningful filenames. Keep YAML indentation in `mkdocs.yml` at two spaces and preserve its existing structure.

## Testing Guidelines

There is no automated unit-test suite. Validate every documentation change with `mkdocs build --strict`, then inspect affected pages using `mkdocs serve`. Check links, image paths, heading hierarchy, and rendered code blocks. If moving a page, update any links and relevant `mkdocs.yml` navigation entries in the same change.

## Commit & Pull Request Guidelines

Recent history uses short, imperative summaries such as `modify schedule`, `add note`, and `Create a new module named paper reading`. Follow that style: state the visible change in a brief subject line; avoid unrelated edits in one commit. Pull requests should explain the content or configuration change, link related issues when applicable, and include screenshots for changes that affect rendered navigation, layout, or visual assets. Confirm the strict MkDocs build in the PR description.
