CONFIG_DIR := "/tmp"
NVIM_DIR := CONFIG_DIR / "nvim"

install SYMBOLIC="":
	[[ -z "{{SYMBOLIC}}" ]] \
	&& cp -R nvim {{CONFIG_DIR}} \
	|| (PUSHPWD=$(pwd) && pushd {{CONFIG_DIR}} && ln -s $PUSHPWD/nvim nvim && popd)

uninstall SYMBOLIC="":
	[[ -z {{SYMBOLIC}} ]] \
	&& rm -r {{NVIM_DIR}} \
	|| rm    {{NVIM_DIR}} 

change-config CONFIG:
	sed -ie '0,/"[^"]*"/s//"{{replace(CONFIG, '/', '\/')}}"/' justfile

clean:
	rm -rf dev/
	rm -rf nvim/plugin
	mkdir dev
