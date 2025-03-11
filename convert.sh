set -eu

for outfit in generated/*; do
	outfit_name=$(basename ${outfit})

	for body in generated/${outfit_name}/*; do
		body_name=$(basename ${body})

		for eyes in generated/${outfit_name}/${body_name}/*; do
			eyes_name=$(basename ${eyes})

			mkdir -p "converted-png/${outfit_name}/${body_name}/${eyes_name}"

			for faces in generated/${outfit_name}/${body_name}/${eyes_name}/*; do
				faces_name=$(basename -s .svg ${faces})

				output="converted-png/${outfit_name}/${body_name}/${eyes_name}/${faces_name}.png"

				if [ -f $faces ] && [ ! -f $output ]; then
					svgexport $faces $output 9x
				fi
			done
		done
	done
done
