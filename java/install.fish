#!/usr/bin/env fish
abbr -a mvnci 'mvn clean install'
set -Ux MAVEN_OPTS -Xmx1024m

if command -qs /usr/libexec/java_home
	set -Ux JAVA_HOME (/usr/libexec/java_home -v 11)
end
