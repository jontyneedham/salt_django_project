source code:
  file:
    - symlink
    - name: /home/simon/Workspaces/vm/app
    - target: {{ pillar['website_src_dir'] }}
    - force: True