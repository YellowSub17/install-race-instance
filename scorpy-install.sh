



if [ $(whoami) != 'ec2-user' ]
then
    echo "Error: only users name 'ec2-user' can run this script"
    exit 1

fi


cd ~/downloads
git clone https://github.com/YellowSub17/scorpy-pkg.git




conda deactivate
conda create -n phd python==3.9 --yes
conda activate phd
conda install -c conda-forge ipython --yes
conda install -c conda-forge numpy --yes
conda install -c conda-forge matplotlib --yes
conda install -c conda-forge pyshtools --yes
conda install -c conda-forge h5py --yes
conda install -c conda-forge pycifrw --yes
conda install -c conda-forge scipy --yes
conda install -c conda-forge scikit-image

