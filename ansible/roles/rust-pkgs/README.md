# Rust Packages Role

This role installs basic Rust packages using Cargo. It installs tools such as **ripgrep** and **rd-find**. It depends on the `rust` role to ensure Rust and Cargo are installed prior to installing these packages.

## Role Variables

*None defined by default.*

## Example Playbook

```yaml
- hosts: all
  roles:
    - rust_packages
