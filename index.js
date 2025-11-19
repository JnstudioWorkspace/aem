const { execSync } = require("child_process");
const path = require("path");

// Lokasi APK
const apkPath = path.join(__dirname, "app.apk");

// Package name aplikasi kamu
const packageName = "com.example.yourapp";  // ganti sesuai paket APK kamu

// Fungsi menjalankan command shell
function run(cmd) {
    console.log(">>", cmd);
    try {
        const output = execSync(cmd, { stdio: "pipe" }).toString();
        console.log(output);
    } catch (err) {
        console.error(String(err));
    }
}

// 1. Cek device emulator
run("adb devices");

// 2. Install APK
run(`adb install -r "${apkPath}"`);

// 3. Jalankan aplikasi
run(`adb shell monkey -p ${packageName} -c android.intent.category.LAUNCHER 1`);

console.log("APK berhasil dijalankan!");
