# Ansible Role: Perl & Neovim::Ext Installation

This role ensures that Perl and cpanminus are installed on the target system and then installs the CPAN module **Neovim::Ext**.

**Steps performed:**
1. Install Perl and cpanminus via the system package manager.
2. Check if the Neovim::Ext module is already installed.
3. If not installed, use cpanminus to install Neovim::Ext.

Make sure your system has access to the package repositories for Perl and cpanminus.
