#!/bin/sh
LINT=`which dockerlint`
echo '#!/bin/sh' > ./_test.sh
for f in */Dockerfile; do
     echo "echo Linting ${f} ..." >> ./_test.sh
     echo "${LINT} -f ${f}" >> ./_test.sh
     echo 'let z=$z+$?' >> ./_test.sh
done
echo 'echo exiting with ${z} ...' >> ./_test.sh
echo 'exit ${z}' >> ./_test.sh
chmod ugo+x ./_test.sh

