npx prettier . --write 'templates/**/*.svg' --object-wrap collapse --print-width 120 --plugin=@prettier/plugin-xml --xml-whitespace-sensitivity ignore

mkdir generated

mkdir -p generated/templates/outfit generated/templates/body generated/templates/eyes generated/templates/faces

cp templates/outfit/* generated/templates/outfit

for body in templates/body/*; do
	body_name=$(basename -s .svg ${body})

	diff -u templates/body/base.svg $body > generated/templates/body/${body_name}.patch
done

for eyes in templates/eyes/*; do
	eyes_name=$(basename -s .svg ${eyes})

	diff -u templates/eyes/base.svg $eyes > generated/templates/eyes/${eyes_name}.patch
done

for faces in templates/faces/*; do
	faces_name=$(basename -s .svg ${faces})

	diff -u templates/faces/base.svg $faces > generated/templates/faces/${faces_name}.patch
done