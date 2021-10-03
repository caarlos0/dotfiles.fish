#!/usr/bin/env fish
abbr -a mvnci 'mvn clean install'
set -Ux MAVEN_OPTS -Xmx1024m

if command -qs /usr/libexec/java_home
    if /usr/libexec/java_home >/dev/null 2>&1
    	set -Ux JAVA_HOME (/usr/libexec/java_home -v 11)
    end
end
