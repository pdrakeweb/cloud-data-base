# Copyright 2016 Acquia, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM centos:7.1.1503

ENV LANG=en_US.utf8

# Install packages and RVM.
RUN set -xe \
    && yum remove -y fakesystemd \
    && yum install -y systemd-devel mysql-devel git tar patch libyaml-devel glibc-headers autoconf gcc-c++ glibc-devel patch readline-devel libffi-devel make bzip2 automake libtool bison sqlite-devel \
    && gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 \
    && curl -sSL https://get.rvm.io | bash \
    && yum clean all

# Install Ruby and Bundler.
RUN /bin/bash -l -c "rvm install 2.2.4 \
    && rvm default 2.2.4 \
    && gem install bundler \
    && rvm cleanup all"

MAINTAINER Acquia Engineering <engineering@acquia.com>
