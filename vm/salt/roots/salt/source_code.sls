source code:
  file:
    - symlink
    - name: /home/simon/Python/tunes/situnes/music
    - target: {{ pillar['website_src_dir'] }}
    - force: True