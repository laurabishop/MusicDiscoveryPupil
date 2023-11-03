
# Shell call
shell_call <- function(command, ...) {
  result <- system(command, intern = TRUE, ...)
  # cat(paste0(result, collapse = "\n"))
}

# Install Packages using r2U (a lot faster than installing them directly from CRAN)
# Only works in Colab!
shell_call("sudo apt update -qq && apt install --yes --no-install-recommends wget ca-certificates gnupg")
shell_call("wget -q -O- https://eddelbuettel.github.io/r2u/assets/dirk_eddelbuettel_key.asc | tee -a /etc/apt/trusted.gpg.d/cranapt_key.asc")

shell_call('echo "deb [arch=amd64] https://r2u.stat.illinois.edu/ubuntu jammy main" > /etc/apt/sources.list.d/cranapt.list')
shell_call('sudo apt update -qq')

shell_call('echo "Package: *" > /etc/apt/preferences.d/99cranapt')
shell_call('echo "Pin: release o=CRAN-Apt Project" >> /etc/apt/preferences.d/99cranapt')
shell_call('echo "Pin: release l=CRAN-Apt Packages" >> /etc/apt/preferences.d/99cranapt')
shell_call('echo "Pin-Priority: 700"  >> /etc/apt/preferences.d/99cranapt')

shell_call('sudo apt install r-cran-lme4')
shell_call('sudo apt install r-cran-ggplot2')
shell_call('sudo apt install r-cran-mgsub')
shell_call('sudo apt install r-cran-sciplot')
shell_call('sudo apt install r-cran-car')

install.packages(c("FBN", "lmerTest"), lib = "/usr/local/lib/R/site-library")