# -*- coding: utf-8 -*-


"""setup.py: setuptools control."""


import re
from setuptools import setup


if __name__ == "__main__":
    version = re.search(
        '^\s*__version__\s*=\s*"(.*)"',
        open('aurea_github_jervis_webhooks/JervisWebHooks.py').read(),
        re.M
    ).group(1)

    with open("README.md", "rb") as readme:
        long_descr = readme.read().decode("utf-8")

    setup(
        name="aurea-github-jervis-webhooks",
        packages=["aurea_github_jervis_webhooks"],
        entry_points={
            "console_scripts": [
                'aurea-jervis-webhooks = aurea_github_jervis_webhooks.__main__:main'
            ]
        },
        version=version,
        include_package_data=True,
        description="Script for automatically provision webhooks in GitHub for Jervis",
        long_description=long_descr,
        install_requires=[
            "pygithub <= 1.999"
        ],
        author="Vladimir Chernyshkov",
        author_email="vladimir.chernyshkov@aurea.com",
        url="",
    )