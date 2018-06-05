# -*- coding: utf-8 -*-

"""aurea-github-jervis-webhooks.JervisWebHooks: provides entry point main()."""

# import sys
import argparse
import os
from github import Github
from github.Organization import Organization
from aurea_github_jervis_webhooks.UpdateWebHook import UpdateWebHook
from aurea_github_jervis_webhooks.Config import Config


class JervisWebHooks:
    __version__ = "0.1.0"

    @staticmethod
    def _parse_repositories(file, string_repositories):
        # type: (str, str) -> str[]
        repositories = []

        if file:
            if not os.path.isfile(file):
                print("Error: file not found %s" % file)
            else:
                with open(file, 'r', encoding="UTF-8") as repo_file:
                    for repository in repo_file:
                        repository_name = repository.strip().lower()
                        if repository_name != '' and repository_name not in repositories:
                            repositories.append(repository_name)

        if string_repositories:
            repo_str = string_repositories.split(",")
            for repository in repo_str:
                repository_name = repository.strip().lower()
                if repository_name != '' and repository_name not in repositories:
                    repositories.append(repository_name)

        return repositories

    @staticmethod
    def _get_github(org_name, token):
        # type: (str, str) -> Organization|Github
        github = Github(token)

        if org_name:
            github = github.get_organization(org_name)

        return github

    @staticmethod
    def _prepare_config(args):
        return Config(args.jenkins, args.secret, args.delete)

    @staticmethod
    def _update_repositories(github, repositories, config):
        # type: (Organization|Github, str[], Config) -> None
        for repository in repositories:
            UpdateWebHook(github, repository, config).update()

        return

    @staticmethod
    def _process_args(args):
        print(args)

        repositories = JervisWebHooks._parse_repositories(args.file, args.repositories)

        if not repositories:
            print("Error: repositories list is empty")
            exit(1)

        github = JervisWebHooks._get_github(args.organization, args.token)
        config = JervisWebHooks._prepare_config(args)

        JervisWebHooks._update_repositories(github, repositories, config)

        return


    @staticmethod
    def main():
        print("Executing aurea-github-jervis-webhooks version %s." % JervisWebHooks.__version__)
        print("List of arguments")  #: %s" % sys.argv[1:])
        parser = argparse.ArgumentParser(
            description="Automatic provision webhooks in GitHub for Jervis."
        )
        parser.add_argument(
            "-t", "--token",
            required=True,
            action="store",
            dest="token",
            help="Token for GitHub (should have at least: repo, admin:repo_hook, read:org, read:user)"
        )
        parser.add_argument(
            "-o", "--org",
            required=False,
            action="store",
            dest="organization",
            default="trilogy-group",
            help="Name of organization"
        )
        parser.add_argument(
            "-j", "--jenkins",
            required=False,
            action="store",
            dest="jenkins",
            default="http://jervis-public.aureacentral.com/github-webhook/",
            help="Url of jenkins github-webhook API"
        )
        parser.add_argument(
            "-s", "--secret",
            required=False,
            action="store",
            dest="secret",
            help="Secret for Jervis"
        )
        parser.add_argument(
            "-d", "--delete",
            required=False,
            action="store_true",
            dest="delete",
            default=False,
            help="Add this param if you want to remove webhooks instead of adding them"
        )
        parser.add_argument(
            "-f", "--file",
            required=False,
            action="store",
            dest="file",
            help="File with list of repositories"
        )
        parser.add_argument(
            "-r", "--repositories",
            required=False,
            action="store",
            dest="repositories",
            help="Comma separated list of repositories"
        )

        JervisWebHooks._process_args(parser.parse_args())

        return
