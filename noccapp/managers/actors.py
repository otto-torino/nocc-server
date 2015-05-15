from django.db import models

class DoctorManager(models.Manager):

    def surgeons(self):
        return self.filter(is_surgeon=True)

    def oncologists(self):
        return self.filter(is_oncologist=True)

    def radiotherapists(self):
        return self.filter(is_radiotherapist=True)
