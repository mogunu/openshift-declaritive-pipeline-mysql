# requirements

## openshift/OKD

> I used [minishift](https://github.com/minishift/minishift) for this, and also ran a persistent Jenkins master server within minishift. Used RedHat's template which already has the kubernetes, openshift, etc. plugins installed and configured.

- start minishift server: `minishift start --memory 8GB --cpus 4`
- once the cluster starts, log into the web UI with `developer\developer`

## jenkins

- deploy jenkins server:

```
oc new-project jenkins 
git clone https://raw.githubusercontent.com/openshift/origin/master/examples/jenkins/jenkins-persistent-template.json
oc new-app -f jenkins-persistent.json
```

- once the jenkins server is running, log into Jenkins web UI with `developer\developer`
- create a multi-branch pipeline project, and point it to this repo on github, click "build now".
