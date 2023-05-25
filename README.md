## Deploying Stacks

Change the directory

```
cd reejig-terrmate/stacks/sbx-bb
``` 

Once the configuration is changed we need to update the generated code by running:

```sh
terramate generate
```

At this point since our project has uncommitted changes Terramate will prevent us
from running any commands. Create a branch (or use the flag `--disable-check-git-uncommitted`
to disable the git checks):

```
git checkout -b <your branch name>
```

And commit all the changed files.

Now we initialize all our stacks:

```
terramate run -- terraform init
```

Check how their plans look like:

```
terramate run -- terraform plan
```

And apply them:

```
terramate run -- terraform apply
```

For each Cloud Run service deployed there will be an output with the URL to
the deployed service, like this:

```
url = "https://terramate-app1-<env>-<hash>-lz.a.run.app"
```

You can check the outputs with:

```
terramate run -- terraform output
```

Open the URL on the browser to check the running service.

To avoid unnecessary charges to your account let's destroy all stacks:

```
terramate run --reverse -- terraform destroy
```

The `--reverse` flag runs all stacks in reversed order, which is desirable
when destroying resources.

