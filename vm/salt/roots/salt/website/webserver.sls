nginx:
  pkg:
    - installed
    - names:
      - nginx

  service:
    - running
    - watch:
      - pkg: nginx
      - file: /etc/nginx/nginx.conf

/etc/nginx/nginx.conf:
  file:
    - managed
    - source: salt://website/nginx.conf
    - user: root
    - group: root
    - mode: 644
