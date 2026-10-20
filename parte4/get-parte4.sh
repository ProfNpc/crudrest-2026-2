#!/bin/bash

parte_guia=4

rm -fr crudrest-2026-2
rm -fr workspace

# Clone with no files initially checked out
git clone --depth 1 --filter=blob:none --sparse https://github.com/ProfNpc/crudrest-2026-2.git

cd crudrest-2026-2

# Checkout no diretório parteN/crudrest-parteN
git sparse-checkout set parte${parte_guia}/crudrest-parte${parte_guia}

cd ..

mkdir -p workspace

# Copia o projeto crudrest
cp -aT crudrest-2026-2/parte${parte_guia}/crudrest-parte${parte_guia} workspace/crudrest


