;; This is an operating system configuration template
;; for a "bare bones" setup, with no X11 display server.

(use-modules (gnu))
(use-modules (guix packages))
(use-service-modules networking ssh)
(use-package-modules certs)

(operating-system
  (host-name "guixsd")
  (timezone "Europe/London")
  (locale "en_US.utf8")

  (bootloader (bootloader-configuration
                (bootloader grub-bootloader)
                (target "/dev/sda")))
  (file-systems (cons (file-system
                        (device (file-system-label "my-root"))
                        (mount-point "/")
                        (type "ext4"))
                      %base-file-systems))

  (users (append (list (user-account
                (name "vagrant")
                (password (crypt "vagrant" "$6$abc"))
                (group "users")
                (supplementary-groups '("wheel")))
               (user-account (inherit %root-account)
                (password (crypt "password" "$6$abc"))))
               %base-user-accounts))

  (sudoers-file (plain-file "sudoers" "\
root ALL=(ALL) ALL
vagrant ALL=(ALL) NOPASSWD: ALL\n"))

  (packages (append (list nss-certs) (filter (lambda (p)
    (not (member (package-name p) '("wireless-tools" "iw" "zile")))) ; Not needed in Vagrant environment
    %base-packages)))

  (services (append (list (service dhcp-client-service-type)
                          (service openssh-service-type
                                   (openssh-configuration
                                    (permit-root-login #t)
                                    (port-number 22))))
                    %base-services)))
