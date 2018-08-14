# docker-n56u-builder

Docker images to compile [padavan's rt-n56u custom firmware](https://bitbucket.org/padavan/rt-n56u).

```bash
git clone https://github.com/wiserain/docker-n56u-builder.git
cd docker-n56u-builder
docker-compose run n56u
docker-compose rm -f n56u
docker rmi n56u
```
