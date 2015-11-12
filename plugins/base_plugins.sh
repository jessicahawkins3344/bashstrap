# Base Plugiins
function banish-cookies ()
{
    rm -r ~/.macromedia ~/.adobe
    ln -s /dev/null ~/.adobe
    ln -s /dev/null ~/.macromedia
}

function add_ssh() {
  about 'add entry to ssh config'
  param '1: host'
  param '2: hostname'
  param '3: user'
  group 'ssh'

  echo -en "\n\nHost $1\n  HostName $2\n  User $3\n  ServerAliveInterval 30\n  ServerAliveCountMax 120" >> ~/.ssh/config
}

show-proxy ()
{
	echo ""
	echo "Environment Variables"
	echo "====================="
	env | grep -i "proxy" | grep -v "BASH_IT"

	bash-it-show-proxy
	npm-show-proxy
}


bash-it-show-proxy ()
{
	echo ""
	echo "bash-it Environment Variables"
	echo "============================="
	echo "(These variables will be used to set the proxy when you call 'enable-proxy')"
	echo ""
	env | grep -e "BASH_IT.*PROXY"
}

npm-show-proxy ()
{
	if $(command -v npm &> /dev/null) ; then
		echo ""
		echo "npm"
		echo "==="
		echo "npm HTTP  proxy: " `npm config get proxy`
		echo "npm HTTPS proxy: " `npm config get https-proxy`
	fi
}