;; This is an operating system configuration template
;; for a "bare bones" setup, with no X11 display server.

(use-modules (gnu))
(use-service-modules networking ssh)

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

  (services (append (list (service dhcp-client-service-type)
                          (service openssh-service-type
                                   (openssh-configuration
                                    (permit-root-login #t)
                                    (port-number 22))))
                    %base-services)))