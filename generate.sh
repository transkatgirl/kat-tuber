rm -r generated

mkdir generated

for outfit in templates/outfit/*; do
	outfit_name=$(basename -s .svg ${outfit})

	mkdir "generated/${outfit_name}"

	for body in templates/body/*; do
		body_name=$(basename -s .patch ${body})

		mkdir "generated/${outfit_name}/${body_name}"

		for eyes in templates/eyes/*; do
			eyes_name=$(basename -s .patch ${eyes})

			mkdir "generated/${outfit_name}/${body_name}/${eyes_name}"

			for faces in templates/faces/*; do
				faces_name=$(basename -s .patch ${faces})

				output="generated/${outfit_name}/${body_name}/${eyes_name}/${faces_name}.svg"

				cp $outfit $output
				patch --silent --ignore-whitespace --no-backup-if-mismatch $output $body
				patch --silent --ignore-whitespace --no-backup-if-mismatch $output $eyes
				patch --silent --ignore-whitespace --no-backup-if-mismatch $output $faces
			done
		done
	done
done
