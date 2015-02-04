git:
  pkg.latest

emacs24:
  pkg.latest


dotted_wrdes:
  git.latest:
    - name: https://github.com/wrdeman/dotted_wrdes.git
    - target: {{ pillar ['dot_files'] }}
    - require:
        - pkg: git
