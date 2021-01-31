# SolvePnP GLSL

This is a partial implementation of a few versions of the Perspective-n-Point algorithm using pure GLSL shader lang. Implementations are focused on a square marker reference, such as an AR marker. Vertex shaders are used for debugging purposes to view outputs. An example run script has been provided in the prebuilt executible. It can be run using `./run.sh 0 2 3` to output a 2x3 array of the final camera rotation and translation based on the test object points and image points defined in the shader `feedback.vert`.

- `feedback.vert` - Copy of IPPE implementation, used for testing
- `feedback_solvepnp_opencv.vert` - Implementation of OpenCV's generic PnP solver
- `feedback_solvepnp_lambdatwist.vert` - Implementation of OpenMVG's [Lambda Twist](https://github.com/midjji/pnp) (Nordberg, 2018)
- `feedback_solvepnp_ippe.vert` - Implementation of OpenCV's IPPE PnP solver

### Example usage to simulate augmented reality in a virtual environment

Implemented within the popular game Minecraft
https://gfycat.com/accurateimpureaxolotl

### License

This project is made available under the [MIT license](LICENSE).
