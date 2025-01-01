# Configuration for mbsyncrc / isyncrc #
########################################

{ pkgs, config, ... }:

{
  programs.mbsync = {
    enable = true;
    package = pkgs.isync;
    extraConfig = ''
      IMAPAccount proton
      Host 127.0.0.1
	Port 1143
	User admin@jccpalmer.com
	PassCmd "cat ~/.protonBridgePass"
	TLSType NONE
	CertificateFile "/etc/ssl/certs/ca-certificates.crt"
	AuthMechs LOGIN

	IMAPStore proton-remote
	Account proton

	MaildirStore proton-local
	Subfolders Verbatim
	Path ~/.mail/proton
	Inbox ~/.mail/proton/inbox

	Channel inbox
	Far :proton-remote:
	Near :proton-local:
	Patterns * !"Drafts" !"All Mail"
	Create Both
	SyncState *

	Group proton
	Channel inbox
    '';
  };
}
