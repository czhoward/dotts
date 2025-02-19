#!/bin/env bash


: ${1?"Usage:  dotts.sh [install|uninstall]"}

action=$1;

BIN="${HOME}/.local/bin"

[[ ! -v APP_NAME ]] && APP_NAME=dotts
COMMAND="${BIN}/${APP_NAME}"


installDotts(){
mkdir -p "${BIN}"
rm ${BIN}/dotts.sh ${COMMAND}  >/dev/null 2>&1
cat << 'EOF' > $BIN/dotts.sh
#!/bin/env bash
/usr/bin/git --git-dir=$HOME/.dotts/ --work-tree=$HOME "$@"
EOF

chmod u+x ${BIN}/dotts.sh
ln -s ${BIN}/dotts.sh ${COMMAND}

git init --bare $HOME/.dotts
${COMMAND}  config init.defaultBranch main
${COMMAND} checkout  >/dev/null 2>&1

${COMMAND} config status.showUntrackedFiles no
echo '.dotts' > $HOME/.gitignore
${COMMAND} add  $HOME/.gitignore
${COMMAND} commit -m 'initial commit'
echo "installed dotts"
}

uninstallDotts(){
 rm ${BIN}/dotts.sh  ${COMMAND} >/dev/null 2>&1
if [[ $? == 0 ]]; then 
echo 'uninstalled dotts' 
else
echo 'no installation of dotts exists'
fi
}


[[ $action == "uninstall" ]] && uninstallDotts
[[ $action == "install" ]] && installDotts

