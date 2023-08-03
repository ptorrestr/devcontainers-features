#!/bin/sh
CERTIFICATE_FOLDER="${CERTIFICATEFOLDER:-"/usr/local/share/ca-certificates/custom-ca"}"
CERTIFICATE_FILE="ZscalerRootCertificate-2048-SHA256.crt"
PYTHON_BIN_PATHS="${PYTHONBINPATHS}"

set -e

source ./library_scripts.sh
echo "Activating feature Zscaler"


# The 'install.sh' entrypoint script is always executed as the root user.
#
# These following environment variables are passed in by the dev container CLI.
# These may be useful in instances where the context of the final
# remoteUser or containerUser is useful.
# For more details, see https://containers.dev/implementors/features#user-env-var



copy_certificate
for _python_bin in $PYTHON_BIN_PATHS
do
    python_support $_python_bin
done

echo "Done!"
