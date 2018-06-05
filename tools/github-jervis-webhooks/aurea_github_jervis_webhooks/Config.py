# -*- coding: utf-8 -*-

"""aurea-github-jervis-webhooks.Config: provides configuration."""

class Config():

    def __init__(self, jenkins_url, secret='', do_delete=False):
        # type: (str, bool) -> None
        self._jenkins_url = jenkins_url
        self._delete = do_delete
        self._secret = secret

        return

    def get_hook_name(self):
        """
        Use "web" for a webhook or use the name of a valid service
        https://developer.github.com/v3/repos/hooks/
        :return: str
        """
        return "web"

    def get_jenkins_url(self):
        return self._jenkins_url

    def get_delete(self):
        return self._delete

    def get_events(self):
        return [
            "push",
            "pull_request"
        ]

    def get_conf(self):
        config = {
            "url": self._jenkins_url,
            "content_type": "json"
        }

        if self._secret:
            config['secret'] = self._secret

        return config
