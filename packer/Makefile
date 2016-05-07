build:
	packer build template.json

clean:
	rm -fv *.box
	rm -rfv output-*

add-box:
	vagrant box add --force nomad-intro ubuntu-14.04-with-docker.virtualbox.box
