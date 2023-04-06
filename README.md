the two files explain everything.

example:

```
# docker run -d --rm -h my_awesome_runner --name runner -v /var/run/docker.sock:/var/run/docker.sock  \
    -e RUNNER_URL=https://github.com/user/repo -e RUNNER_TOKEN=XYREGTOKENXY buffertly/github-runner
```
