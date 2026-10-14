#!/bin/bash

sts=/d/sts-4.22.1.RELEASE/SpringToolSuite4.exe

parte_guia=2

rm -fr crudrest-2026-2
rm -fr workspace

# Clone with no files initially checked out
git clone --depth 1 --filter=blob:none --sparse https://github.com/ProfNpc/crudrest-2026-2.git

cd crudrest-2026-2

# Checkout no diretório parteN/crudrest-parteN
git sparse-checkout set parte${parte_guia}/crudrest-parte${parte_guia}

# Inclui também o diretório workspace
git sparse-checkout add workspace

cd ..

mkdir -p workspace/crudrest
mkdir -p workspace/.metadata

# Copia o projeto crudrest
cp -aT crudrest-2026-2/parte${parte_guia}/crudrest-parte${parte_guia} workspace/crudrest

# Copia o .metadata para workspace ...
cp -aT crudrest-2026-2/workspace/.metadata workspace/.metadata

# ... e .project e .classpath para workspace/crudrest para o STS já abrir o projeto certinho
cp crudrest-2026-2/workspace/.project workspace/crudrest/.project
cp crudrest-2026-2/workspace/.classpath workspace/crudrest/.classpath

# Altera workspace/.metadata para não ser mais readonly
#chmod -v u+rw workspace/.metadata


$sts -os win32 -ws win32 -arch x86_64 -product org.springframework.boot.ide.branding.sts4 -data workspace -import workspace\crudrest -clean -vmargs -Djava.security.manager=allow


