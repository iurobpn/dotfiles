---
# Stow dotfiles Role

This Ansible role symlinks dotfiles from the `dotfiles` directory to the home directory of the user specified in the `ansible_user` variable.

## Role Variables

*None defined by default.*

## Example Playbook

- hosts: all
roles:
  pre_tasks:
  - name: 
    include_role:
      name: stow-dotfiles

roles:
  - stow
  ...

