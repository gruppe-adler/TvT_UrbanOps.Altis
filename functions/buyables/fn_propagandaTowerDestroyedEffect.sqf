_this spawn {
    params ["_tower"];

    private "_pos";
    _pos = (getPosASL _tower) vectorAdd [0,0,1.5];

    private "_sparks";
    _sparks = "#particlesource" createVehicleLocal _pos;
    _sparks setPosASL _pos;
    _sparks setParticleClass "LaptopSparks";

    sleep 1.2;

    private "_smoke";
    _smoke = "#particlesource" createVehicleLocal _pos;
    _smoke setPosASL _pos;
    _smoke setParticleClass "LaptopSmoke";

    private "_sparksSound2";
    _sparksSound2 = createSoundSource ["Sound_SparklesWreck1", _pos, [], 0];

    sleep 0.5;
    deleteVehicle _sparks;
    sleep 2.5;
    deleteVehicle _sparksSound2;
    deleteVehicle _smoke;
};
