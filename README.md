# Expectation-Maximisation Algorithm by Esther Alberts

Dockerfile and supporting files to create a new Docker image from the Source Code at Bitbucket

Version: 0.0

Author: Christoph Berger

### Build your own image: 

```
docker build https://github.com/njarng/embts.git
```
This command builds a fresh Docker image in the context of this repo based on the Dockerfile provided. Alternatively, you can clone the repo and run the build locally with: 
```
docker build . < Dockerfile
```
This sends the current directory to the Docker daemon and uses the Dockerfile contained therein.

### Run the container: 
Note: The main.py script expects correctly named and placed files and directories as input, please read the PDF file containing detailed information on how to name and place your own files.
```
docker run -v $(pwd):/data --workdir=/usr/src/app -i -t cberger/em_final python main.py
```

Usage: In the directory containing a folder "Input" with the subfolders "preprocessed_data" (containing T1, T1c, T2, FLAIR and Flair_Mask) and "registered_atlas" (containing csf, grey, white), run the image with the following command:
docker run -v $(pwd):/data --workdir=/usr/src/app -i -t cberger/em_final python main.py
The output is written to /data/Results/ in the current folder on the host.

[Optional] CLI arguments for the main.py script if you want to provide fewer volumes than in the example:
```
usage: main.py [-h] [-a] [-t1] [-t1c] [-t2] [-f]
optional arguments:
-h, --help   show this help message and exit
-a, --all    To use all modalities: DEFAULT
-t1, --T1    Use this flag to look for the T1 volume: MR_T1.704.nii
-t1c, --T1c  Use this flag to look for the T1c volume: MR_T1c.705.nii
-t2, --T2    Use this flag to look for the T2 volume: MR_T2.706.nii
-f, --Flair  Use this flag to look for the Flair volume: MR_Flair.703.nii
```

### License and Author
Based on the Expectation-Maximisation Algorithm of Esther Alberts.
For full instructions and licensing, see: https://bitbucket.org/s0216660/brain_tumor_segmentation_em