# -*- coding: utf-8 -*-

"""aurea-github-jervis-webhooks.UpdateWebHook: executes actions."""

from github import Github
from github.GithubException import UnknownObjectException
from github.Organization import Organization


class UpdateWebHook:

    def __init__(self, github, repository, config):
        # type: (Organization|Github, str) -> None
        self._repository = github.get_repo(repository)
        self._config = config
        print("")
        print("Processing repository: %s" % repository)

        return

    def _get_already_added(self):
        """
        :rtype: :class:`github.Hook.Hook`
        """
        already_added = None

        try:
            webhooks = self._repository.get_hooks()

            if webhooks:
                for webhook in webhooks:
                    if webhook.config["url"] == self._config.get_jenkins_url():
                        already_added = webhook
        except UnknownObjectException as exc:
            print("Repository does not have *any* webhooks, or we don't have enough permissions")
            print("Token should have at least: repo, admin:repo_hook, read:org, read:user")

        return already_added

    def update(self):
        try:
            if self._config.get_delete():
                return self.remove()
            else:
                return self.add()
        except UnknownObjectException as exc:
            print("Do we have enough permissions for this repo?")

    def add(self):
        already_added = self._get_already_added()

        if already_added:
            print("Webhook was already added")
        else:
            self._repository.create_hook(
                self._config.get_hook_name(),
                self._config.get_conf(),
                self._config.get_events(),
                True
            )
            print("Webhook successfully added")

        return

    def remove(self):
        already_added = self._get_already_added()

        if already_added:
            already_added.delete()
            print("Webhook successfully deleted")
        else:
            print("Webhook was not setup or already deleted or we don't have enough permissions")

        return
