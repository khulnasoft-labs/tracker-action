# Production Ready

**This project is not production ready. We are experimenting with it to test and demostrate Tracker capabilities.**

# Protect your GitHub Actions with Tracker

[Tracker](https://github.com/khulnasoft/tracker) is a powerful open source runtime security and forensics solution. It is using eBPF to trace your system, produce rich events that gives you visibility into what is happening under the hood, and also detects suspicious behavior in those event.

This project is using Tracker to protect GitHub Actions workflow against supply chain attacks. You can add the `khulnasoft-lab/tracker-action` GitHub Action to your workflow, which will automatically install Tracker in the runner and start tracing it.

## Protection

There are two modes of protection that tracker-action offers: Signatures, and Profile.

### Signatures

Tracker runs in the background and hunts for suspicious behavior in the runner and in the workflow. It uses the powerful set of behavioral signatures that is available for Tracker, and you can add your own specific signatures to detect unwanted behavior.
Signatures detections are reported to you as a comment on the PR that triggered the action for your review.
You can review the list of default signatures [here](docs/signatures.md)

### Profile

While the profile is running Tracker builds a profile that describes how your workflow normally behaves. Once you approve this initial profile as the baseline, tracker-action will detect and report any deviation from it.
Profile deviations are reported to you as a new PR that add commits the changes to a `.tracker` directory in the project.
You can review the contents of the default profile [here](docs/profile.md)

## Getting Started

Add tracker-action to the beginning of your workflow with the tag ending with `-start`, and to the end of your workflow with the tag ending with `-stop`.
Example:

```yaml
name: My pipeline
jobs:
  my-job:
    runs-on: ubuntu-latest
    steps:
    - name: Start Tracker
      uses: khulnasoft-labs/tracker-action@v0.3.0-start

    ...

    - name: Stop Tracker
      uses: khulnasoft-labs/tracker-action@v0.3.0-stop
```

There are some configuration options the are detailed [here](docs/config.md)

---

Tracker is an [KhulnaSoft Security] open source project.
Learn about our open source work and portfolio [Here].
Join the community, and talk to us about any matter in [GitHub Discussion] or [Slack].

[KhulnaSoft Security]: https://khulnasoft.com
[GitHub Discussion]: https://github.com/khulnasoft/tracker/discussions
[Slack]: https://slack.khulnasoft.com
[Here]: https://www.khulnasoft.com/products/open-source-projects/
